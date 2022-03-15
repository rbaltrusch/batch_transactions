import random
import datetime
from dataclasses import dataclass


@dataclass
class Transaction:
    sender: str
    receiver: str
    amount: int

    def __post_init__(self):
        self.status = "SUBMITTED"


class DateTransaction(Transaction):
    def __post_init__(self):
        super().__post_init__()
        self.date = datetime.datetime.now()


class TransactionManager:
    @staticmethod
    def process_transactions(transactions):
        for transaction in transactions:
            if transaction.amount > 60:
                transaction.status = "IN_PROGRESS"
            print(transaction)


def main():
    receivers = [
        "carling",
        "joking",
        "loking",
        "koking",
        "eorlking",
        "poki",
        "goki",
        "woki",
        "lowkey",
    ]

    senders = ["carl", "simon", "paul", "john", "jake", "robert"]

    transactions = []
    for i, sender in enumerate(senders):
        class_ = Transaction if i % 2 == 0 else DateTransaction
        transaction = class_(
            sender, random.choice(receivers), amount=random.randint(0, 100)
        )
        transactions.append(transaction)

    TransactionManager.process_transactions(transactions)


if __name__ == "__main__":
    main()
