apt_package 'zsh'

home_directory '.zsh'

zsh_files_dir = Helper.home('.zsh')

git "#{zsh_files_dir}/zsh-syntax-highlighting" do
  repository 'https://github.com/zsh-users/zsh-syntax-highlighting.git'
  reference 'master'
  action :sync
end

zsh_file 'zsh-syntax-highlighting'
zsh_file 'prompt'
zsh_file 'ssh'

user_cookbook_file '.zshrc'

bash 'make ZSH the default login shell' do
  code "sudo chsh -s `which zsh` #{Helper.user}"
end
