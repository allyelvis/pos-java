import sqlite3

def init_db():
    connection = sqlite3.connect('pos_system.db')
    cursor = connection.cursor()

    cursor.execute('''CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        stock INTEGER NOT NULL
    )''')

    cursor.execute('''CREATE TABLE IF NOT EXISTS sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER,
        quantity INTEGER,
        total REAL,
        FOREIGN KEY(product_id) REFERENCES products(id)
    )''')

    connection.commit()
    connection.close()

if __name__ == '__main__':
    init_db()
