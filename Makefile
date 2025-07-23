TARGET		=	dotfiles

build:
	podman build -t "$(TARGET)" .

run:
	podman run -it "$(TARGET)"
