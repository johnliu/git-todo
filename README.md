git-todo
========

A simple git extension to search for TODOs inside source code.


## Requirements

- awk or grep (awk is recommended).
- python (2.x)


## Installation

In general, download `git-todo` and `git-todos` and move the script to some place within your
path.


## Usage

Note: both `git todo` and `git todos` can be used, as long as both scripts are installed.
```sh
# Search for default TODOs (by specified user, or same as --none if unspecified).
$ git todo
source_a.c
5:// TODO(johnliu): refactor into two classes

# Find all todos.
$ git todo --all      # or git todo -a
source_a.c
5:// TODO(johnliu): refactor into two classes
10:// TODO(otheruser): change all instances of class A to class B
23:// TODO: refactor to common functions file

source_b.c
48:// TODO(otheruser): rework user flow page, this is temporary.

# Find todos by a specific users (in the form of TODO(user)).
$ git todo --user=otheruser       # or git todo -u=otheruser
source_a.c
10:// TODO(otheruser): change all instances of class A to class B

source_b.c
48:// TODO(otheruser): rework user flow page, this is temporary.

# Find todos by multiple users
$ git todo --user=otheruser,johnliu       # or git todo -u=otheruser,johnliu
source_a.c
5:// TODO(johnliu): refactor into two classes
10:// TODO(otheruser): change all instances of class A to class B

source_b.c
48:// TODO(otheruser): rework user flow page, this is temporary.

# Find todos without a user (in the form of TODO:)
$ git todo --none       # or git todo -n
source_a.c
23:// TODO: refactor to common functions file

# Search starting from here.
$ git todo --user=otheruser --here      # or git todo -h u=otheruser
source_b.c
48:// TODO(otheruser): rework user flow page, this is temporary.
```


## Options

Set the following in your `.gitconfig` file:
```gitconfig
[todo]
  user = johnliu,liujohn        # the username(s) to search for by default.
  default = user                # user, all or none (user by default)
```
