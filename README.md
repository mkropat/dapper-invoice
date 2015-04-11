## dapper-invoice

A billable-time invoice featuring style over substance.

![Example Screenshot](http://i.imgur.com/q78jtGu.png)

### Pre-Requisites

- [TeX Live](https://www.tug.org/texlive/acquire-netinstall.html)

### Generating an Invoice

```
cp example.tex your-invoice-101.tex
# make some changes to your-invoice-101.tex
make your-invoice-101.pdf
```

Your invoice will be created as `your-invoice-101.pdf`

### Documentation

See [example.tex](example.tex) and [dapper-invoice.cls](dapper-invoice.cls) for details.

### Inspiration

I am not a designer.  Inspiration for the design comes from
stea^H^H^H^Hborrowing design ideas from good looking invoices people have
[published on the
net](http://www.smashingmagazine.com/2009/11/05/invoice-like-a-pro/).  The
resulting design is not even in the same league, but I think it gets the job
done.

I am also not a LaTeX author.  The code borrows heavily from the
[moderncv](https://launchpad.net/moderncv) package (which I can't recommend
enough), as well as numerous other packages.

### Licensing

The code I have written I release under the MIT license.

Two different font packages are included in the repo for convenience:

- OpenSans (Apache License v2.00)
- Font Awesome (SIL OFL 1.1)
