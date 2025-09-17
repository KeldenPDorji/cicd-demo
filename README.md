# CI/CD Demo with Snyk Security Scanning

![Java](https://img.shields.io/badge/Java-17-red?style=flat-square&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.9-brightgreen?style=flat-square&logo=spring-boot)
![Maven](https://img.shields.io/badge/Maven-3.8+-blue?style=flat-square&logo=apache-maven)
![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?style=flat-square&logo=github-actions)
![Snyk](https://img.shields.io/badge/Security-Snyk-4C2B5E?style=flat-square&logo=snyk)
<img src="https://raw.githubusercontent.com/gauravpatil97886/gauravpatil97886/main/gaurav_gif/Line.gif" alt="Animated Line" />

A comprehensive CI/CD demonstration project showcasing **Static Application Security Testing (SAST)** integration with **Snyk** in GitHub Actions. This project implements automated security scanning, vulnerability management, and continuous monitoring as part of a modern DevSecOps pipeline.

## 🎯 Project Overview

This Spring Boot application demonstrates best practices for integrating security scanning into CI/CD pipelines using Snyk for vulnerability detection and management. The project serves as a learning resource for implementing DevSecOps practices in Java-based applications.

### Key Features

- ✅ **Automated Security Scanning** with Snyk integration
- ✅ **GitHub Actions CI/CD Pipeline** with security-first approach
- ✅ **SARIF Integration** for GitHub Security tab reporting
- ✅ **Vulnerability Management** with custom ignore policies
- ✅ **Docker Security** with multi-stage builds
- ✅ **Code Coverage** reporting with JaCoCo
- ✅ **Dependency Management** with security-focused updates

## 🏗️ Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Developer     │───▶│  GitHub Actions  │───▶│  Snyk Platform │
│   Commits Code  │    │  CI/CD Pipeline  │    │  Security Scan  │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
                       ┌──────────────────┐    ┌─────────────────┐
                       │  Build & Test    │    │  Security       │
                       │  Maven/JaCoCo    │    │  Report SARIF   │
                       └──────────────────┘    └─────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- Java 17 or higher
- Maven 3.8+
- Docker (optional)
- GitHub account
- Snyk account

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/cicd-demo.git
   cd cicd-demo
   ```

2. **Build and run tests**
   ```bash
   mvn clean compile
   mvn test
   ```

3. **Start the application**
   ```bash
   mvn spring-boot:run
   ```

4. **Test the endpoints**
   ```bash
   curl http://localhost:8080/
   curl http://localhost:8080/version
   curl http://localhost:8080/nations
   curl http://localhost:8080/currencies
   ```

### Docker Deployment

1. **Build the Docker image**
   ```bash
   docker build -t cicd-demo .
   ```

2. **Run the container**
   ```bash
   docker run -p 8080:8080 cicd-demo
   ```

## 🔒 Security Features

### Snyk Integration

This project implements comprehensive security scanning with Snyk:

- **Dependency Scanning**: Identifies vulnerabilities in Maven dependencies
- **SARIF Reporting**: Integrates security results with GitHub Security tab
- **Automated Monitoring**: Continuous monitoring of security posture
- **Custom Policies**: Configured ignore policies for acceptable risks

### Security Configuration

The project includes several security enhancements:

#### 1. Dependency Security
- Explicit version management for transitive dependencies
- Security-focused exclusions in `pom.xml`
- Regular dependency updates

#### 2. Container Security
- Multi-stage Docker builds
- Non-root user execution
- Minimal attack surface with Alpine Linux

#### 3. Code Security
- Static analysis with Snyk Code
- Custom exclusion patterns in `.snyk`
- Security-focused coding practices

## 🔧 API Endpoints

| Endpoint | Method | Description | Response |
|----------|--------|-------------|----------|
| `/` | GET | Health check endpoint | `"HEALTH CHECK OK!"` |
| `/version` | GET | Application version | `"The actual version is 1.0.0"` |
| `/nations` | GET | Random nation data | JSON array of 10 nations |
| `/currencies` | GET | Random currency data | JSON array of 20 currencies |

### Sample Responses

**GET /nations**
```json
[
  {
    "nationality": "Australian",
    "capitalCity": "Canberra",
    "flag": "🇦🇺",
    "language": "English"
  }
]
```

**GET /currencies**
```json
[
  {
    "name": "United States Dollar",
    "code": "USD"
  }
]
```

## 🔄 CI/CD Pipeline

### GitHub Actions Workflow

The project uses a two-stage pipeline:

```yaml
┌─────────────┐    ┌──────────────────┐
│ Test Stage  │───▶│ Security Stage   │
│ - Build     │    │ - Snyk Scan      │
│ - Unit Test │    │ - SARIF Upload   │
│ - Coverage  │    │ - Monitoring     │
└─────────────┘    └──────────────────┘
```

#### Stage 1: Build and Test
- Maven compilation
- Unit test execution
- JaCoCo code coverage
- Test result reporting

#### Stage 2: Security Analysis
- Snyk dependency scanning
- SARIF format reporting
- GitHub Security integration
- Continuous monitoring setup

### Workflow Triggers

- **Push to master**: Full pipeline execution
- **Pull Requests**: Security validation
- **Scheduled**: Weekly security reviews

## 📊 Code Coverage

The project uses JaCoCo for code coverage analysis:

- **XML Reports**: For CI/CD integration
- **HTML Reports**: For local development
- **Coverage Thresholds**: Configurable quality gates

Generate coverage reports:
```bash
mvn test jacoco:report
open target/site/jacoco/index.html
```

## 🛡️ Security Configuration

### Snyk Configuration (`.snyk`)

The project includes a comprehensive Snyk configuration:

```yaml
version: v1.0.0

# Vulnerability ignore policies
ignore:
  # Example configurations for managing acceptable risks

# Language-specific settings
language-settings:
  java:
    include-dev-deps: true

# Exclusion patterns
exclude:
  - 'target/**'
  - '**/*.class'
```

### Security Best Practices Implemented

1. **Dependency Management**
   - Explicit version declarations
   - Security-focused exclusions
   - Regular updates

2. **Container Security**
   - Multi-stage builds
   - Non-root user
   - Minimal base images

3. **CI/CD Security**
   - Secret management
   - SARIF integration
   - Automated monitoring

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `SNYK_TOKEN` | Snyk API token for scanning | Yes |
| `SERVER_PORT` | Application port (default: 8080) | No |

### Application Properties

```properties
# Server configuration
server.port=8080

# Actuator endpoints
management.endpoints.web.exposure.include=health,info
management.endpoint.health.show-details=always
```

## 🚦 Getting Started with Security Scanning

### 1. Set up Snyk Account

1. Create account at [snyk.io](https://snyk.io)
2. Generate API token
3. Add `SNYK_TOKEN` to GitHub Secrets

### 2. Enable Security Scanning

The pipeline automatically runs security scans on:
- Every push to master
- Pull request creation
- Weekly scheduled scans

### 3. Monitor Security Results

- **GitHub Security Tab**: View SARIF reports
- **Snyk Dashboard**: Detailed vulnerability analysis
- **Action Logs**: Scan execution details

## 📈 Monitoring and Alerting

### Security Monitoring

- **Continuous Monitoring**: Automated scans on code changes
- **Vulnerability Tracking**: GitHub Security advisories
- **Compliance Reporting**: Regular security posture reports

### Metrics and Dashboards

- Code coverage trends
- Security vulnerability counts
- Build success rates
- Dependency health scores

## 🛠️ Development Workflow

### Adding New Dependencies

1. Add dependency to `pom.xml`
2. Run security scan locally: `snyk test`
3. Address any vulnerabilities
4. Commit changes
5. Monitor CI/CD pipeline

### Handling Security Vulnerabilities

1. **Review** vulnerability details
2. **Assess** risk in project context
3. **Update** dependency if fix available
4. **Configure** ignore policy if acceptable risk
5. **Document** decision rationale

## 🧪 Testing

### Running Tests

```bash
# Unit tests
mvn test

# Integration tests
mvn verify

# Security tests
snyk test

# All tests with coverage
mvn clean test jacoco:report
```

### Test Structure

```
src/test/java/
├── CicdDemoApplicationTests.java    # Application context tests
└── DataControllerTest.java          # Controller unit tests
```

## 📚 Learning Resources

### Documentation
- [Snyk Documentation](https://docs.snyk.io/)
- [GitHub Actions Security](https://docs.github.com/en/actions/security-guides)
- [Spring Boot Security](https://spring.io/guides/gs/securing-web/)

### Security Best Practices
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [DevSecOps Guidelines](https://www.devsecops.org/)
- [Container Security](https://kubernetes.io/docs/concepts/security/)

**Happy Secure Coding! 🔒**

*This project demonstrates the integration of security scanning into modern CI/CD pipelines, emphasizing the importance of shifting security left in the development lifecycle.*
