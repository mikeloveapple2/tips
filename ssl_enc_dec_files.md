#SSL Encrypt and Decrypt File

    :from: https://linuxconfig.org/using-openssl-to-encrypt-messages-and-files-on-linux

## Encrypt and Decrypt File

### Encrypt
    openssl enc -aes-256-cbc -in omg -out omg.enc

### Decrypt
    openssl enc -aes-256-cbc -d -in services.dat > services.txt
    
## Using Public and Private keys

todo
