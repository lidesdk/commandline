--- $ lide install 'lide.http'

local github = {}
local http   = require 'http.init'

-- --- github.get_file ( 'lidesdk/framework/LICENSE', 'v0.0.01' )
-- --- github path: [user]/[repo]/[file_path]
-- function github.get_file ( cloud_file_path, ref, access_token )
-- 	local query_parameters = { 
-- 		-- ref	string	The name of the commit/branch/tag. Default: the repository�s default branch (usually master)
-- 		ref = ref or nil
-- 	}

-- 	local headers = {
-- 		['Accept'] = 'application/vnd.github.v3.raw'
-- 	}

-- 	if access_token then
-- 		headers['Authorization'] = 'token ' .. access_token
-- 	end

-- 	local x1 = cloud_file_path:find('/')
-- 	local x2 = cloud_file_path:find('/', x1+1)
-- 	local x3 = cloud_file_path:find('/', x2+1)

-- 	local _github_user = cloud_file_path:sub(0   , x1-1 );
-- 	local _github_repo = cloud_file_path:sub(x1+1, x2-1 );
-- 	local _github_file = cloud_file_path:sub(x2+1, #cloud_file_path );
	
-- print(tostring(('https://api.github.com/repos/%s/%s/contents/%s'):format(_github_user, _github_repo, _github_file)))

-- 	local response = http.get { 
-- 		headers = headers,
-- 		query_parameters = query_parameters ,

-- 		url = tostring(('https://api.github.com/repos/%s/%s/contents/%s'):format(_github_user, _github_repo, _github_file)),
-- 		--{allow_redirects = false}
-- 	}	
	
-- 	-- Code 200: Significa que todo va bien:
-- 	if (response.status_code == 200) then
-- 		-- Retornamos el archivo completo:
-- 		return response.text
-- 	else
--         -- Retornamos false y el archivo de error:
-- 		return false, response.status_code, response.status
-- 	end
-- end

--- github.download_file ( 'lidesdk/framework/LICENSE', 'v0.0.01' )
--- github path: [user]/[repo]/[file_path]
function github.download_file ( cloud_file_path, dest_file_path, ref, access_token )
	local x1 = cloud_file_path:find('/')
	local x2 = cloud_file_path:find('/', x1+1)
	local x3 = cloud_file_path:find('/', x2+1)

	local _github_user   = cloud_file_path:sub(0   , x1-1 );
	local _github_repo   = cloud_file_path:sub(x1+1, x2-1 );
	local _github_file   = cloud_file_path:sub(x2+1, #cloud_file_path );
	local _github_branch = 'master'
	

	local github_full_url = tostring(('https://raw.githubusercontent.com/%s/%s/%s/%s'):format(_github_user, _github_repo, _github_branch, _github_file));
	--https://api.github.com/repos/%s/%s/contents/path
	
	http.download(github_full_url, dest_file_path, function ( ... )
		-- body
	end)
end

return github