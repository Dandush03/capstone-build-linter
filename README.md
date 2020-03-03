# Daniel Review Gem (DRev) [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/Dandush03/capstone-build-linter)
[![Gem](https://img.shields.io/gem/v/DRev?style=flat)](https://rubygems.org/gems/DRev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)]()
![GitHub followers](https://img.shields.io/github/followers/Dandush03?label=Dandush03&style=social)
![Twitter URL](https://img.shields.io/twitter/url?label=d_laloush&style=social&url=https%3A%2F%2Ftwitter.com%2Fd_laloush)

> This is a Microverse Captsopne Project

> CSS Lint

![Recordit GIF](https://raw.githack.com/Dandush03/BLOB/master/DRev/Program.gif)

---

## Table of Contents

- [Installation](#Installation)
	- [Set-Up](#Set-Up)
	- [Install-Gem](#Installing-Gem)
- [Features](#features)
	-	[Error List & Examples](#Error-List-&-Examples)
		- [E_101](#E_101-Mising-Brackets)
		- [W_201](#W_202-Indentation)
		- [W_202](#W_202-Mising-Line)
		- [W_203](#W_203-Mising-End-of-File)
		- [W_204](#W_204-Mising-Line)
		- [W_205](#W_205-Mising-Extra)
- [How to Use](#How-to-Use)
- [Built With](#Built-With)
- [Support](#Support)
- [Contributing](#Contributing)
- [Acknowledgments](#Acknowledgments)
- [License](#License)
- [Author](#Authors)

---

## Installation
    
- [Set-Up](#Set-Up)
- [Install-Gem](#Installing-Gem)

<img src="https://raw.githubusercontent.com/Dandush03/BLOB/master/DRev/Project.png" width=600></img>

### Set-Up

#### If you have already Install RUBY && GEMS Skip to [Install-Gem](#Installing-Gem) Section

- Let's start with updating our apt

  ```bash
	sudo apt-get update
	```

- Then we need to install Ruby

	```bash
	sudo apt-get install ruby-full
	```

	Let's verify it's working correctly by opening a text editor and save the following text as test.rb

	```bash
	#!/usr/bin/env ruby
	puts "Hello world!"
	```

	In the terminal window, change directory to the directory where you saved test.rb. Run the command
	```bash
	chmod +x test.rb
	./test.rb
	```

	Then you should see the message Hello world! displayed if Ruby is installed correctly.

	If it didn't work, check [Ruby Installation Page](https://www.ruby-lang.org/en/documentation/installation/)

- All that is left is to install Gem Package by typing in our Terminal

	```bash
	sudo apt-get install rubygems
	```

### Installing Gem

#### After making sure you've all the [Set-Up](#Set-Up) Process Completed

- Let's start installing the bundle gem. (Skip this step if you already used Gems Before)

	```bash
	gem install bundler
	```

- Now we can install DRev Gem by typing

	```bash
	gem install DRev
	```

## Congratulation! Now You Can Start Using DRev
---

## Features

As far as this version release DRev will check the following issue:

	- Extras/Unessesaries empty lines.
	- Indentations (By Default and as far, for now, it will check indentations of 2).
	- Last EoF Empty Line.
	- Missing Closing or Opening Brackets.
---
## Error List & Examples

- ### E_101 (Mising Brackets)

	Bad Code
	
	```css 
	1	body {
	2	  width: 101px;
	3	
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	```

- ### W_201 (Indentation)

	Bad Code
	
	```css 
	1	body {
	2			width: 101px;
	3	}
	```

	or

	```css 
	1	body {
	2	width: 101px;
	3	}
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	```


- ### W_202 (Mising Line)

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4	section {
	5	  height: 300px;
	6	}
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
	```

- ### W_203 (End of File)

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
  9
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
	```

- ### W_204 (Mising Line)

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	5	section {
	6	  height: 300px;
	7	}
	8
	```

- ### W_205 (Exra Line)

	Bad Code

	```css
	1	body {
	2	  width: 101px;
	3
	4	}
	5
	```

	Good Code

	```css
	1	body {
	2	  width: 101px;
	3	}
	4
	```

## How to Use

Essay and Simple! Just open the folder on your terminal witch you want to check and type the following command!

```bash
DRev
```

---

## Built With

- Bundle
- Ruby
- Bash
- Vim
- GitHub
- Gem
- Shields.io

---

## Support

Reach out to me at one of the following places!

- LinkedIn at [Daniel Laloush](https://www.linkedin.com/in/daniel-laloush-0a7331a9)
- Twitter at [@d_laloush](https://twitter.com/d_laloush)

---

## Contributing 🤝

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](./issues/).
---

## Acknowledgments

- Hat tip to anyone whose code was used
- Thanks to Microverse for it Support!

---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2015 © <a href="http://fvcproductions.com" target="_blank">FVCproductions</a>.

## Author

**Danie Laloush**

- Portafolio: [dlaloush.me](https://dlaloush.me) (Comming Soon)
- Linkedin: [Daniel Laloush](https://www.linkedin.com/in/daniel-laloush-0a7331a9)
- Github: [@Dandush03](https://github.com/Dandush03)
- Twitter: [@d_laloush](https://twitter.com/d_laloush)

Give a ⭐️ if you like this project!
