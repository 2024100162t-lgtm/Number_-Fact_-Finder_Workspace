# Number Fact Finder

A Dart-based command-line application that retrieves and displays interesting facts about numbers using the Numbers API.

## Project Description

The **Number Fact Finder** is a command-line application developed using Dart. It connects to the Numbers API to retrieve interesting facts about a selected number and displays the results through a simple command-line interface.

The project demonstrates API integration, JSON data processing, object-oriented programming, command-line interaction, error handling, terminal styling, automated testing, and the organization of a Dart workspace with multiple packages.

## Objectives

The project aims to:

1. Retrieve interesting number facts from the Numbers API.
2. Process and convert API responses into Dart objects.
3. Provide a command-line interface for querying number facts.
4. Allow users to search for facts about specific numbers.
5. Implement error handling for API and network-related problems.
6. Use terminal colors to improve the command-line interface.
7. Organize the application using a Dart workspace with multiple packages.
8. Implement automated tests for the project components.

## Features

* Query number facts from the Numbers API.
* Search for facts using a specific number.
* Display interesting information about numbers.
* Provide an interactive command-line interface.
* Handle API and network errors.
* Use terminal colors for improved output.
* Convert API responses into Dart models.
* Provide help commands for users.
* Include automated tests.

## Technologies Used

* **Dart**
* **Numbers API**
* **HTTP**
* **JSON**
* **Dart Testing Framework**
* **ANSI Terminal Colors**
* **Git**
* **GitHub**
* **Visual Studio Code**

## Project Structure

```text
numbers_workspace/
│
├── terminal_colors/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── ansi.dart
│   │   │   └── terminal_colors_base.dart
│   │   ├── terminal_colors.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── numbers_api/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── client.dart
│   │   │   ├── exceptions.dart
│   │   │   ├── models.dart
│   │   │   └── ...
│   │   ├── numbers_api.dart
│   │   └── ...
│   ├── test/
│   ├── example/
│   └── pubspec.yaml
│
├── numbers_cli/
│   ├── bin/
│   │   └── numbers_cli.dart
│   ├── lib/
│   │   ├── src/
│   │   │   ├── command_base.dart
│   │   │   ├── help_command.dart
│   │   │   └── query_command.dart
│   │   ├── numbers_cli.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── pubspec.yaml
├── pubspec.lock
└── .gitignore
```

## Package Description

### terminal_colors

The `terminal_colors` package provides reusable ANSI terminal color constants and styling utilities used to improve the appearance of the command-line interface.

### numbers_api

The `numbers_api` package handles communication with the Numbers API. It contains the API client, number fact data models, and exception handling for API-related errors.

### numbers_cli

The `numbers_cli` package provides the command-line interface of the application. It handles user commands, number fact queries, help commands, and formatted terminal output.

## Requirements

Before running the project, make sure the following are installed:

* Dart SDK 3.12.2 or later
* Git
* Visual Studio Code or another Dart-compatible IDE
* Internet connection

## Installation

Clone the repository:

```bash
git clone https://github.com/2024100103t-stack/number_fact_finder_workspace.git
```

Navigate to the project directory:

```bash
cd number_fact_finder_workspace
```

Get the project dependencies:

```bash
dart pub get
```

## API Configuration

The application uses the Numbers API to retrieve interesting facts about numbers.

No API key is required for the basic Numbers API request.

Example API endpoint:

```text
http://numbersapi.com/{number}
```

## How to Run

Navigate to the CLI package:

```bash
cd numbers_cli
```

Run the application:

```bash
dart run
```

The application will display the command-line interface:

```text
Number Fact Finder [numbers] >
```

## Example Usage

The application allows users to query interesting facts about a specific number.

Example command:

```text
[numbers] > query 42
```

Example output:

```text
--- NUMBER FACT REPORT ---

Number: 42

Fact:
42 is the answer to the Ultimate Question of Life,
the Universe, and Everything.
```

The displayed number fact is retrieved from the Numbers API.

## Available Commands

### Query

Search for an interesting fact using a number.

```text
query 42
```

### Help

Display available commands and usage information.

```text
help
```

### Exit

Close the application.

```text
exit
```

## Error Handling

The application implements exception handling for possible API and network-related problems.

Examples of errors that may be handled include:

* Invalid API responses
* Network connection errors
* Invalid number input
* API request failures
* Missing or unavailable data

## Testing

The project includes automated tests for its packages and components.

To analyze the entire workspace:

```bash
dart analyze
```

To run the tests:

```bash
dart test
```

A successful analysis should display:

```text
No issues found!
```

## Dart Workspace

The project is organized as a Dart workspace containing multiple related packages:

```text
terminal_colors
numbers_api
numbers_cli
```

This structure allows the packages to be developed and managed together while keeping their responsibilities separated.

## Sample Workflow

The general workflow of the application is:

```text
User
  │
  ▼
Command-Line Interface
  │
  ▼
Query Command
  │
  ▼
Numbers API Client
  │
  ▼
Numbers API
  │
  ▼
API Response
  │
  ▼
Dart Number Fact Model
  │
  ▼
Formatted Number Fact Report
  │
  ▼
Terminal Output
```

## Conclusion

The **Number Fact Finder** demonstrates how Dart can be used to develop a command-line application that communicates with an external REST API.

The project provides practical experience in API integration, JSON processing, object-oriented programming, error handling, terminal formatting, automated testing, and multi-package Dart workspace organization.

## Author

**Joylyn Madrazo**

## Academic Project

This project was developed as part of an academic Dart programming project.
