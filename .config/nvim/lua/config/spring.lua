local M = {}

-- Detecta se o projeto atual é um projeto Spring Boot
function M.is_spring_boot_project()
	-- Verifica se há dependências do Spring Boot no pom.xml
	local pom_file = vim.fn.findfile("pom.xml", vim.fn.getcwd() .. ";")
	if pom_file ~= "" then
		local pom_content = vim.fn.readfile(pom_file)
		for _, line in ipairs(pom_content) do
			if line:match("spring%-boot") then
				return true
			end
		end
	end

	-- Verifica se há dependências do Spring Boot no build.gradle
	local gradle_file = vim.fn.findfile("build.gradle", vim.fn.getcwd() .. ";")
	if gradle_file ~= "" then
		local gradle_content = vim.fn.readfile(gradle_file)
		for _, line in ipairs(gradle_content) do
			if line:match("spring%-boot") then
				return true
			end
		end
	end

	return false
end

-- Executa o projeto Spring Boot
function M.run_spring_boot()
	-- Determina o tipo de projeto
	local is_maven = vim.fn.findfile("pom.xml", vim.fn.getcwd() .. ";") ~= ""
	local is_gradle = vim.fn.findfile("build.gradle", vim.fn.getcwd() .. ";") ~= ""
		or vim.fn.findfile("build.gradle.kts", vim.fn.getcwd() .. ";") ~= ""

	-- Comando para executar o projeto
	local cmd
	if is_maven then
		cmd = "mvn spring-boot:run"
	elseif is_gradle then
		-- Verifica se é um projeto Gradle com wrapper
		if vim.fn.filereadable("./gradlew") == 1 then
			cmd = "./gradlew bootRun"
		else
			cmd = "gradle bootRun"
		end
	else
		vim.notify("Não foi possível determinar o tipo de projeto Spring Boot", vim.log.levels.ERROR)
		return
	end

	-- Executa o comando em um terminal flutuante
	vim.cmd("vsplit | terminal " .. cmd)
	vim.cmd("startinsert")

	vim.notify("Executando Spring Boot: " .. cmd, vim.log.levels.INFO)
end

-- Limpa o projeto
function M.clean_project()
	local cmd
	local is_maven = vim.fn.findfile("pom.xml", vim.fn.getcwd() .. ";") ~= ""
	local is_gradle = vim.fn.findfile("build.gradle", vim.fn.getcwd() .. ";") ~= ""
		or vim.fn.findfile("build.gradle.kts", vim.fn.getcwd() .. ";") ~= ""

	if is_maven then
		cmd = "mvn clean"
	elseif is_gradle then
		if vim.fn.filereadable("./gradlew") == 1 then
			cmd = "./gradlew clean"
		else
			cmd = "gradle clean"
		end
	else
		vim.notify("Não foi possível determinar o tipo de projeto", vim.log.levels.ERROR)
		return
	end

	vim.cmd("terminal " .. cmd)
	vim.notify("Limpando projeto: " .. cmd, vim.log.levels.INFO)
end

-- Configura mapeamentos para projetos Spring Boot
function M.setup()
	-- Adicionar mapeamentos de teclas apenas quando estiver em um projeto Spring Boot
	if M.is_spring_boot_project() then
		vim.notify("Projeto Spring Boot detectado. Carregando configurações específicas.", vim.log.levels.INFO)

		-- Mapeamentos específicos para Spring Boot
		vim.keymap.set("n", "<leader>sr", function()
			M.run_spring_boot()
		end, { desc = "Executar Spring Boot" })
		vim.keymap.set("n", "<leader>sc", function()
			M.clean_project()
		end, { desc = "Limpar projeto" })

		-- Adiciona os mapeamentos ao which-key se disponível
		local has_wk, wk = pcall(require, "which-key")
		if has_wk then
			wk.register({
				{ "<leader>s", group = "Spring" },
				{
					"<leader>sr",
					function()
						M.run_spring_boot()
					end,
					desc = "Executar Spring Boot",
				},
				{
					"<leader>sc",
					function()
						M.clean_project()
					end,
					desc = "Limpar projeto",
				},
			})
		end
	end
end

return M
