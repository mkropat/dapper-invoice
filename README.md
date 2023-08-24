## dapper-invoice

A billable-time invoice featuring style over substance.

![Example Screenshot](http://i.imgur.com/q78jtGu.png)

### Pre-Requisites

- [TeX Live](https://www.tug.org/texlive/acquire-netinstall.html)
- TeX xetex (siunitx.sty)
- TeX science (fontawesome.sty)

— or —

- [Vagrant](https://www.vagrantup.com/downloads.html)

— or —

- [Docker](https://www.docker.com/get-started)

### Generating an Invoice

#### Using TeX Live Locally

```
make vars.tex # so you can add your details
cp example.tex your-invoice-101.tex
# make some changes to your-invoice-101.tex
make your-invoice-101.pdf
```

Your invoice will be created as `your-invoice-101.pdf`

#### Using Vagrant

```
cp example.tex your-invoice-101.tex
vagrant up  # this may take a while the first time
vagrant ssh -c 'cd /vagrant; make REPORT=your-invoice-101 watch'
```

Now whenever you make changes to `your-invoice-101.tex` on your host machine,
the watcher inside the VM will automatically build `your-invoice-101.pdf`,
which will be saved back to the host machine.

When finished editing, input <kbd>Control</kbd>-<kbd>C</kbd> to stop the
watcher, then run:

```
vagrant halt
```

#### Using Docker

Use Docker Hub's [`blang/latex`](https://hub.docker.com/r/blang/latex/) image that comes with a matching .sh file.
When you first run this .sh file, it will pull the docker image that includes
all of the latex dependencies.

```
wget https://raw.githubusercontent.com/blang/latex-docker/master/latexdockercmd.sh
chmod +x latexdockercmd.sh
./latexdockercmd.sh  # will pull down image on first use
```

Then, you can use the .sh file as you would xelatex:

```
cp example.tex your-invoice-101.tex
latexdockercmd.sh xelatex [options] your-invoice-101.tex
```

You invoice will be created as `your-invoice-101.pdf`

### Documentation

See [example.tex](example.tex) and [dapper-invoice.cls](dapper-invoice.cls) for details.

### Inspiration

I am not a designer. Inspiration for the design comes from
borrowing design ideas from good looking invoices people have published
[on the
net](http://www.smashingmagazine.com/2009/11/05/invoice-like-a-pro/). The
resulting design is not even in the same league, but I think it gets the job
done.

I am also not a LaTeX author. The code borrows heavily from the
[moderncv](https://launchpad.net/moderncv) package (which I can't recommend
enough), as well as numerous other packages.

### Licensing

The code I have written I release under the MIT license.

Two different font packages are included in the repo for convenience:

- OpenSans (Apache License v2.00)
- Font Awesome (SIL OFL 1.1)
