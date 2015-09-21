FROM debian
MAINTAINER Lance Hartung

# Install python interpreter.
RUN apt-get update && apt-get install -y python

# Install our python code to the filesystem.
COPY mycode /opt/myproject/mycode

# Drop down to an unprivileged user.
USER daemon

# Tell python where to find our code.
ENV PYTHONPATH /opt/myproject

# Go run it.
CMD ["python", "-m", "mycode.main"]
