# Step 1: Gradle 빌드 단계
FROM gradle:8.5-jdk17 AS build

# 작업 디렉토리 설정
WORKDIR /app

# 프로젝트 코드 복사 및 빌드 수행
COPY . .
RUN gradle clean build -x test

# Step 2: 실행 단계 (Spring Boot 실행)
FROM openjdk:17-jdk-slim

WORKDIR /app

# 빌드된 JAR 파일 복사 (경로는 프로젝트 설정에 따라 다를 수 있음)
COPY --from=build /app/build/libs/*.jar app.jar

# 8080 포트 개방
EXPOSE 8080

# 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]
