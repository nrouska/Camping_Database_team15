import sqlite3
import random


def get_everything(cursor, query):
    cursor.execute(query)

    return [row[0] for row in cursor.fetchall()];


def generate_krathsh_katalyma(cursor, db_path):
    krathseis = get_everything(cursor, 'SELECT kwd_krathshs FROM KRATHSH')
    rv = get_everything(cursor, 'select kwd_katal FROM RV')
    #dwmatio = get_everything(cursor, 'select kwd_katal FROM DWMATIO')
    #xwros_katask = get_everything(cursor, 'select kwd_katal XWROS_KATASKHNWSHS')
    krathsh_katalyma_pairs = set()
    pairs = []
    atoma = get_everything(cursor, '''SELECT arithmos_enhlikwn+arithmos_paidiwn
                                FROM KRATHSH''')
    conn = sqlite3.connect('camping.db')
    cursor = conn.cursor()

    for i, j in zip(krathseis, atoma):
        for k in rv: #dwmatio,xwros_katask
            xwrhtikothta = cursor.execute('Select xwrhtikothta FROM RV WHERE kwd_katal=?', (k,)).fetchone()[0]
            print([row[0] for row in cursor.fetchall()])
            if (j == xwrhtikothta and i not in get_everything(cursor,
                                                              'Select kwd_krathshs FROM KRAT_PERILAMB_KATALYM')):
                pairs.append((
                    i,
                    k
                ))
                rv.remove(k)

                if (i, k) not in krathsh_katalyma_pairs:
                    krathsh_katalyma_pairs.add((i, k))
                    break;


    print(pairs)

    cursor.executemany(
        'INSERT INTO "KRAT_PERILAMB_KATALYM" '
        'VALUES (?, ?)',
        pairs
    )
    conn.commit()


def main():
    db_path = "camping.db"
    connection = sqlite3.connect(db_path)
    cursor = connection.cursor()
    generate_krathsh_katalyma(cursor, db_path)

    connection.commit()
    connection.close()

    return;


if __name__ == "__main__":
    main()