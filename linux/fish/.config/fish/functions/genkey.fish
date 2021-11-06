function genkey -d 'Generate a safe SSH key.'
  ssh-keygen -o -a 256 -t ed25519 -C (hostname)-(date +'%d-%m-%Y')
end
