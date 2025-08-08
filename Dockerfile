# Step 1: Base OCaml image
FROM ocaml/opam:debian-12-ocaml-4.14

# Step 2: Install necessary tools
RUN sudo apt-get update && \
    sudo apt-get install -y make ocaml-findlib libounit-ocaml-dev python3 python3-pip

RUN pip install flask --break-system-packages

# Step 3: Create working directory
WORKDIR /app

# Step 4: Copy all project files into the container
COPY . .

# Step 5: Give permissions to the opam user
RUN sudo chown -R opam:opam /app

# Step 6: Compile the OCaml project
RUN make

# Step 7: Expose Flask port
EXPOSE 5000

# Step 8: Start the Flask server (no longer ./marina directly)
CMD ["python3", "server.py"]
