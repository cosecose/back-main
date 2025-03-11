# Step 1: JDK 환경에서 빌드
FROM maven:3.8.8-eclipse-temurin-17 AS build

WORKDIR /app

# 의존성 캐싱을 위해 먼저 복사
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 소스 코드 복사 및 빌드
COPY . .
RUN mvn clean package -DskipTests

# Step 2: 실행 환경 (JRE)
FROM openjdk:17-jdk-slim

WORKDIR /app

# 빌드된 JAR 복사
COPY --from=build /app/target/*.jar app.jar

# 8080 포트 개방
EXPOSE 8080

# 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]
