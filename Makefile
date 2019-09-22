SCALA_VERSION=2.12.8
ALMOND_VERSION=0.8.1
export

run:
	pipenv run jupyter notebook

install:install-scala
install-scala:install-python
	curl -Lo coursier https://git.io/coursier-cli
	chmod +x coursier
	pipenv run \
  ./coursier bootstrap \
             -r jitpack \
             -i user -I user:sh.almond:scala-kernel-api_${SCALA_VERSION}:${ALMOND_VERSION} \
             sh.almond:scala-kernel_${SCALA_VERSION}:${ALMOND_VERSION} \
             -o almond
	pipenv run ./almond --install
install-python:
	pipenv install
