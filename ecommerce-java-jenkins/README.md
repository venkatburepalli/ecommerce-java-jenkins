# E-Commerce Java Application

A simple Maven WAR application for practicing:

- Git/GitHub
- Jenkins CI/CD
- Maven
- Java 17
- Apache Tomcat 10.1
- WAR deployment

## Project Structure

```text
ecommerce-java-jenkins/
├── pom.xml
├── README.md
└── src/
    └── main/
        ├── java/
        │   └── com/practice/ecommerce/
        │       ├── model/
        │       │   └── Product.java
        │       ├── service/
        │       │   └── ProductService.java
        │       └── servlet/
        │           ├── ProductServlet.java
        │           └── CartServlet.java
        └── webapp/
            ├── index.jsp
            ├── products.jsp
            └── cart.jsp
```

## Build

```bash
mvn clean package
```

The WAR file will be created at:

```text
target/ecommerce-app.war
```

## Deploy to Tomcat

Copy the WAR file to Tomcat's `webapps` directory:

```bash
cp target/ecommerce-app.war /opt/tomcat/webapps/
```

Then start/restart Tomcat.

Open:

```text
http://SERVER-IP:8080/ecommerce-app/
```

## Jenkins Practice

Recommended Jenkins pipeline stages:

1. Checkout code from GitHub
2. Build with Maven
3. Run tests
4. Create WAR
5. Deploy WAR to Tomcat
6. Verify application

Example commands for the Jenkins server:

```bash
mvn clean package
ls -lh target/ecommerce-app.war
```

For a real Jenkins deployment, configure credentials for the Tomcat server and copy/deploy the WAR as part of the pipeline.
