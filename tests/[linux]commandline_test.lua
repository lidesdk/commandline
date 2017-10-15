LIDE_PATH = (os.getenv 'LIDE_PATH')

-- Run standard internal tests:
io.stdout : write '[lide commandline] execution tests: '

	assert(io.popen ('./lide.sh --test') :read '*a':sub(1,19) == '[lide test] all ok.')

io.stdout : write '\t[OK]\n'

-- Test if luasql, lfs are on stable repo with search:
io.stdout : write '[lide commandline] search tests: '
	
	searchline = io.popen ('./lide.sh search lanes') :read '*l'
	print(searchline:sub (1, searchline : find '/' ))
	assert( searchline:sub (1, searchline : find '/' ) == 'stable/')
	searchline = io.popen ('./lide.sh search lanes') :read '*l'
	assert( searchline:sub (1, searchline : find '/' ) == 'stable/')

io.stdout : write '\t[OK]\n'

--

io.stdout : write '[lide commandline] package install tests: '

	installline = io.popen ('./lide.sh install lanes') :read '*a'
	
    assert(type(io.open(LIDE_PATH .. '/libraries/linux/x64/clibs/lanes/core.so', 'rb')) == 'userdata')

io.stdout : write '\t[OK]\n'