FROM schoolofdevops/carts-maven:3.9

WORKDIR /opt/carts

COPY . .

RUN mvn package -D skipTests && \
    mv target/carts.jar /run && \
    rm -rf /opt/carts/*

WORKDIR /run

EXPOSE 80

CMD java -jar carts.jar --port=80
