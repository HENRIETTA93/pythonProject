# Python Dependencies and Virtual Environments

## Background

### Dependencies

The remaining homework assignments, most labs, and the final project will all rely on code written in Python3 (some of it provided, some of it written by you).

Like other modern programming languages, python has a package management system, [pip](https://pypi.org/project/pip/) to handle installation and management of the dependencies in a python project.

By default, when you use pip to install a package, it gets installed globally and is available to the python interpreter that's associated with the instance of pip you used (generally the one in your `PATH`). That's fine in many cases, but sometimes different applications or projects depend on different versions of the same package, and those versions aren't always backwards-compatible. (Remember also that most dependencies themselves have dependencies, and the dependency graph that's created can become quite complex very quickly.)

That problem becomes much worse when you're a developer supporting multiple python applications, which have been developed over a broad range of time. You can't simply rely on your laptop's default instance of pip to have the correct versions of the python packages that the application uses in its production environment.

### Virtual Environments

We get around the above problem by using *Virtual Environments*. They mimic the global python environment to allow pip to do its thing and then allow you the developer to do everything you'd normally want to do with python, but they keep their own copy of the installed dependencies, so that packages installed in one virtual environment won't conflict with packages in another.

Prior to Python 3.3, `virtualenv` was its own [python package](https://virtualenv.pypa.io/en/stable/) that needed to be installed. It now comes with the standard python installation, as the [venv module](https://docs.python.org/3/library/venv.html).

The documentation for the `venv` module is quite good, so I won't duplicate it here. 

*Remember that once you create a virtual environment, you still have to activate it before the commands you run will execute within it.*

### Requirements Files

Often, Python projects/applications will come with a `requirements.txt` file that will declare the dependencies of the project in a [specific way](https://pip.pypa.io/en/stable/reference/pip_install/#requirements-file-format).

You can use `pip` to install the packages defined in a requirements file: `pip install -r requirements.txt`, and that can be done using an active virtual environment as well.

### Pipenv

[Pipenv](https://pipenv.readthedocs.io/en/latest/) adds an additional layer of functionality on top of the standard `venv` and `requirements.txt`. It's a tool that will handle creating a virtual environment and installing dependencies within that environment and keeping those requirements in sync using a `Pipfile`. The idea is that the `Pipfile` can be included in version control repository for the project and then used to create a virtual environment that will be consistent with others, right down to the version of Python used.

## Assignment

The goal for this lab is to practice creating a virtual environment, installing some dependencies in it, and then doing some "development" on code that relies on that environment in the editor/IDE you plan on using for the remainder of the semester.

There is no deliverable for this lab. You may work together as much as you like. The goal here is to make sure that your development environment is properly configured before you need it for other assignments.

### Steps

Create a virtual environment in a location of your choosing. Activate that environment. (You may optionally choose to make use of Pipenv, but that's outside the scope of the lab.)

Install the dependencies specified in the `requirements.txt` file in the `labs/5/` directory.

Change the values in lines 4-7 of `lab-5.py` to reflect how you've set up your [example postgres database](../../examples/db-setup.md) for this class. If you followed the instructions exactly earlier in the semester, this step won't be necessary.

Run `lab-5.py` from the command line. If your virtual environment is still active in your terminal, you should be able to simply run: `python lab-5.py`. It should output the contents of your `course` table, in a nicely formatted table.

Using the editor/IDE of your choice, modify `lab-5.py` by changing line 19 to use `student_query` instead of `course_query`.

Run `lab-5.py` again, this time from within your development environment (either the command line if you're using a text editor, or within your IDE). For those of you using an IDE, you're going to have to modify the run configuration for your project so that it points to your virtual environment, rather than the default python interpreter. For Intellij (PyCharm), VisualStudio and PyDev (the Eclipse python plugin), there's good documentation for doing this, so figure it out on your own if you can. But feel free to ask for help if you need it.