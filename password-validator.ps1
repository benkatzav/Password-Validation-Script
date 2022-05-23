# reading password
[string]$password=$args[0]

# validation bit while equals to 1 means that the password still meets the requirements through the checks
[int]$validation_bit=1

# checks if password contains at least 10 characters
if(!($password.Length -ge 10))
{
	$validation_bit=0
	Write-Host -ForegroundColor red "Password must contain at least 10 characters"
}

# checks if password contains uppercase letters
if (!($password -match '(?-i)[A-Z]+')){
	$validation_bit=0
	Write-Host -ForegroundColor red "Password must contain a minimum of 1 upper case letter"
}

# checks if password contains lowercase letters
if (!($password -match '(?-i)[a-z]+'))
{
	$validation_bit=0
	Write-Host -ForegroundColor red "Password must contain a minimum of 1 lower case letter"
}

# checks if password also contains numeric characters
if (!($password -match '(?-i)[0-9]+'))
{
	$validation_bit=0
	Write-Host -ForegroundColor red "Password must contain a minimum of 1 numeric character"
}

# checks if the password met all of the requirements and prints an output accordingly
if ($validation_bit -eq 1)
{
	Write-Host -ForegroundColor green "Password Valid"
	exit 0
}

# else if the password is NOT valid the program will end up reaching the next line with exit code 1
exit 1
