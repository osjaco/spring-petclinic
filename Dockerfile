FROM alpine/git
WORKDIR /clone
RUN git clone https://github.com/openshift-academia-online/spring-petclinic --single-branch -b dev

