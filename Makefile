install:
	cp .zshrc ~/.zshrc
	cp .tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/nvim/autoload
	mkdir -p ~/.config/nvim/after/ftplugin
	cp nvim/init.vim ~/.config/nvim/init.vim
	cp nvim/after/ftplugin/html.vim ~/.config/nvim/after/ftplugin/html.vim
	cp nvim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim
