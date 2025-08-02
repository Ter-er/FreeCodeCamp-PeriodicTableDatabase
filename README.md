# Periodic Table Database

## What this project is

As part of the freeCodeCamp Relational Database curriculum, I developed a comprehensive periodic table database using PostgreSQL. The project models chemical elements with normalized tables and enforces strict data integrity constraints.

The core schema consists of:
- An `elements` table storing atomic details such as atomic number, symbol, and name.
- A `properties` table holding physical properties like atomic mass, melting point, and boiling point.
- A newly created `types` table categorizing elements by type (e.g., metal, nonmetal).

These tables are connected through well-defined foreign key relationships, ensuring referential integrity across the dataset. The database enforces constraints like uniqueness and non-nullability on critical columns (e.g., `symbol` and `name`), and the data types are carefully selected and adjusted (e.g., atomic masses stored as DECIMAL without trailing zeros) for accuracy and consistency.

To interact with this database, I created a Bash script (`element.sh`) that takes element identifiers—atomic number, symbol, or name—as input and outputs detailed element information from the database. The script gracefully handles invalid input and provides clear feedback.

## What I learned and accomplished

- Designed and refined a normalized database schema with multiple tables linked by foreign keys, practicing best practices for relational data modeling.
- Applied and enforced important constraints, including `NOT NULL`, `UNIQUE`, and foreign key constraints, to maintain data integrity.
- Created and populated a lookup `types` table, replacing redundant type information in properties for better normalization.
- Manipulated data types to improve data accuracy, including converting `atomic_mass` to `DECIMAL` and removing trailing zeros.
- Ensured consistent data formatting by capitalizing element symbols correctly without altering other letters.
- Implemented dynamic querying and output formatting in a Bash script, demonstrating how shell scripting can integrate with PostgreSQL via the command line.
- Handled command-line argument validation and conditional logic to provide informative, user-friendly feedback.
- Practiced version control workflows by initializing a Git repository with multiple well-structured commits, following conventional commit message patterns (`feat:`, `fix:`, `refactor:`, etc.).
- Removed invalid data that violated constraints, ensuring the dataset’s integrity and consistency.

---

This project enhanced my proficiency in relational database design, data normalization, SQL constraints, and command-line integration through Bash scripting. It also strengthened my understanding of best practices in project versioning and commit hygiene.

Feel free to explore the `element.sh` script and the PostgreSQL database schema to see how these components work together to deliver a functional, data-driven CLI application.
