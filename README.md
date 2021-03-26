# Dr Quine

An introduction to Quines and Virus


### Challenge

The following 3 programs in C, ASM, and Python:

* **Colleen** - Print my source code

* **Grace** - Clone myself, spawning my kid

* **Sully** - Self-replicate 5 times

See the [subject](https://github.com/dfinnis/Dr_Quine/blob/master/subject.pdf) for more details.

#### Final Score 125/100


## Getting Started

Clone this repo.

```git clone https://github.com/anyashuka/Dr_Quine.git```

For *ASM/* you may need to install *nasm*.

```brew install nasm```

In *C/* and *ASM/* first make the binaries.

```make```

Then run the binaries.

```./Colleen```, ```./Grace``` & ```./Sully```

In *Python/* run files directly.

```python Colleen.py```, ```python Grace.py``` & ```python Sully.py```


## Examples

Let's demo the python examples:

### Colleen

Print my source code.

Run *Colleen* and compare the output with the source code. This *diff* should output nothing, showing output and source code are identical.

```python Colleen.py > tmp_Colleen ; diff tmp_Colleen Colleen.py```


### Grace

Clone myself, spawning my kid.

Run *Grace* and compare *Grace* with *Grace_kid*. This *diff* should output nothing, showing *Grace* and *Grace_kid* are identical.

```python Grace.py; diff Grace.py Grace_kid.py```


### Sully

Self-replicate 5 times.

Run *Sully* and compare *Sully* with clones. The following command should show the only difference is number.

```python Sully.py; diff Sully.py Sully_5.py; diff Sully.py Sully_4.py; diff Sully.py Sully_3.py; diff Sully.py Sully_2.py; diff Sully.py Sully_1.py; diff Sully.py Sully_0.py```

<img src="https://github.com/dfinnis/Dr_Quine/blob/master/img/sully.png" width="379">


## Tests

The test scripts run the steps shown above for each language, ensuring output/clones are identical to source code.

```./test_all.sh```

<img src="https://github.com/dfinnis/Dr_Quine/blob/master/img/tests.png" width="379">


## Dependencies

* Python 3.9.1 (no requirements.txt necessary)
* NASM 2.14.02
