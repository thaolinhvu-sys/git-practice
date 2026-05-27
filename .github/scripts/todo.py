class Task:
    def __init__(self, title, status="ToDo"):
        self.title = title
        self.completed = False
        self.status = status

    def mark_completed(self):
        self.completed = True
        self.status = "Done"

    def __repr__(self):
        return f"{self.title} - {self.status}"

    def __str__(self):
        return f"Task: {self.title}, Status: {self.status}"


class TaskPool:
    def __init__(self):
        self.tasks = []

    def populate(self):
        self.tasks = [
            Task("Add login UI", "Done"),
            Task("Fix UI bug", "Done"),
            Task("Write tests", "Done"),
            Task("Update login UI", "ToDo"),
            Task("Update documentation", "ToDo"),
            Task("Deploy to production", "ToDo"),
        ]

        for task in self.tasks[:3]:
            task.mark_completed()

    def add_task(self, task):
        self.tasks.append(task)

    def get_open_tasks(self):
        return [t for t in self.tasks if t.status == "ToDo"]

    def get_done_tasks(self):
        return [t for t in self.tasks if t.status == "Done"]


def main():
    pool = TaskPool()
    pool.populate()

    print("ToDo Tasks:")
    for task in pool.get_open_tasks():
        print(task.title)

    print("\nDone Tasks:")
    for task in pool.get_done_tasks():
        print(task.title)


if __name__ == "__main__":
    main()