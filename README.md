<h1 align="center">Welcome to pass, the password generator  👋</h1>
<p>
  <a href="https://twitter.com/kammzinho" target="_blank">
    <img alt="Twitter: kammzinho" src="https://img.shields.io/twitter/follow/kammzinho.svg?style=social" />
  </a>
</p>

> A password generator build on learning purpouses

## Usage
:construction:  
I still need to figure out how to make it easy to distribute as some kind of binary

```sh
# Generic usage
ruby app.rb [OPTIONS]

# Minimal example (using all defaults)
#  12 chars, being a to z, A to Z, 0 to 9 and  ! to /
ruby app.rb 
> 5ugvs5.JOv!1

# Changing the default length
ruby app.rb -l 32
> mtu2WUh+M8ry2qw&YO#mI.Y!aSd43noi

# Generating a pin (only numbers)
ruby app.rb -p -l 8 
> 27843429

# Generating without special characters (default is true)
ruby app.rb -s false -l 8 
> HvLaAWB1
```

## Author

👤 **Vinicius Kammradt**

* Website: [kammradt.super.site](https://kammradt.super.site)
* Twitter: [@kammzinho](https://twitter.com/kammzinho)
* Github: [@kammzinho](https://github.com/kammzinho)
* LinkedIn: [@vinicius-kammradt](https://linkedin.com/in/vinicius-kammradt)

## Show your support

Give a ⭐️ if this project helped you!

