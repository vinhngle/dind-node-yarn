FROM gitlab/dind

RUN which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )
RUN mkdir -p ~/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y && apt-get install nodejs -y && apt-get install yarn -y

ENTRYPOINT ["wrapdocker"]
CMD []
