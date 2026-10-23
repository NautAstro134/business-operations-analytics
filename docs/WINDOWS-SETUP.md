# Windows Analytics Workstation Setup

## Machine

HP Pavilion Notebook running Windows 10.

This machine is used as the primary Windows workstation for Power BI, database tools, analytics projects, and GitHub portfolio work.

## Analytics and Database Software

- Microsoft Power BI Desktop 2.157.1354.0
- Microsoft SQL Server 2025 Developer
- SQL Server Management Studio 22.6.0
- pgAdmin 4 9.17
- Metabase
  - JAR: `C:\metabase\metabase.jar`
- Microsoft ODBC Driver 17 for SQL Server
- Microsoft ODBC Driver 18 for SQL Server

## Development and Command-Line Tools

- Git 2.55.0.windows.3
- GitHub CLI 2.101.0
- Python 3.13.13
- Python Launcher 3.14.7
- Node.js 24.12.0
- npm 11.6.2
- uv 0.12.16
- aria2 1.37.0
- 7-Zip 26.03 (x64)
- jq 1.8.2
- ripgrep (`rg`) 15.2.0
- Ookla Speedtest CLI 1.2.0.84

## Java Runtime

Metabase uses a portable Eclipse Temurin Java runtime.

- Eclipse Temurin OpenJDK 25.0.4.1 LTS
- Java executable: `C:\java25\jdk-25.0.4.1+1-jre\bin\java.exe`
- Metabase JAR: `C:\metabase\metabase.jar`

The Java runtime is not currently in the Windows PATH, so `java -version` by itself does not find it.

Verified with:

`C:\java25\jdk-25.0.4.1+1-jre\bin\java.exe -version`

## GitHub

GitHub CLI is authenticated with the `NautAstro134` GitHub account.

Project repository:

`business-operations-analytics`

## Power BI Project

Business Operations Analytics workflow:

PostgreSQL -> Power BI Desktop -> Dashboard -> GitHub portfolio documentation

The dashboard analyzes the DataCo SMART Supply Chain dataset containing 180,519 records.

## Maintenance Notes

On September 19, 2026, the following components were updated:

- Microsoft ODBC Driver 17
- Microsoft ODBC Driver 18
- Microsoft Visual C++ Redistributable x86
- Microsoft Visual C++ Redistributable x64
- Python Launcher

The pgAdmin upgrade from 9.17 to 9.18 was intentionally cancelled after 18 MB of its 229 MB installer had downloaded. pgAdmin 9.17 remains installed.

Python 3.13.13 remains installed. The Python 3.13.15 update was not installed.

The Temurin Java MSI installer also exists at `C:\metabase\temurin25.msi`, but it is not needed because the working portable Java 25 runtime is already present.

## Bandwidth Maintenance Rule

Avoid bulk `winget upgrade --all` operations on this machine.

Before downloading or upgrading software:

1. Identify what the package is.
2. Determine whether the update is actually needed.
3. Check the approximate download size.
4. Upgrade only after deciding the bandwidth cost is worthwhile.