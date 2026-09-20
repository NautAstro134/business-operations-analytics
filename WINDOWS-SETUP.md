# Windows Analytics Workstation Setup

## Machine

Windows 10 HP Pavilion Notebook used as the primary Power BI and Windows analytics workstation.

## Analytics and Database Software

- Microsoft Power BI Desktop
- Microsoft SQL Server 2025 Developer
- SQL Server Management Studio 22
- pgAdmin 4 9.17
- Metabase
- Microsoft ODBC Driver 17 for SQL Server
- Microsoft ODBC Driver 18 for SQL Server

## Development and Command-Line Tools

- Git 2.55.0
- GitHub CLI 2.101.0
- Python 3.13.13
- Python Launcher
- Node.js 24.12.0
- npm
- uv
- aria2 1.37.0
- 7-Zip 26.03
- jq
- ripgrep (rg)
- Ookla Speedtest CLI 1.2.0.84

## GitHub

GitHub CLI is authenticated with the NautAstro134 GitHub account.

Project repository:

business-operations-analytics

## Power BI Project

Business Operations Analytics uses:

PostgreSQL -> Power BI Desktop -> Dashboard -> GitHub portfolio documentation

The dashboard analyzes the DataCo SMART Supply Chain dataset containing 180,519 records.

## Maintenance Notes

On September 19, 2026, the following components were updated:

- Microsoft ODBC Driver 17
- Microsoft ODBC Driver 18
- Microsoft Visual C++ Redistributable x86
- Microsoft Visual C++ Redistributable x64
- Python Launcher

The pgAdmin 4 upgrade from 9.17 to 9.18 was intentionally cancelled because the installer required a 229 MB download. Version 9.17 remains installed and functional.

Python 3.13.13 remains installed. The 3.13.15 update was not required for current project work.

Bulk `winget upgrade --all` should be avoided on this machine when bandwidth is limited. Check individual package purpose and download size before upgrading.