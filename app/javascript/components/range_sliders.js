var volumeSlider = document.getElementById('volume');
var scrubberSlider = document.getElementById('scrubber');
var sliders = [volumeSlider, scrubberSlider];

function Slider(slider) {
  this.slider = slider;
  if (slider) {
    slider.addEventListener('input', function() {
      this.updateSliderOutput();
      this.updateSliderLevel();
    }.bind(this), false);
  }

  this.level = function() {
    var level = this.slider.querySelector('.slider-input');
    return level.value;
  }

  this.levelString = function() {
    return parseInt(this.level());
  }

  this.remaining = function() {
    return 99.5 - this.level();
  }

  this.remainingString = function() {
    return parseInt(this.remaining());
  }

  this.updateSliderOutput = function() {
    var output = this.slider.querySelector('.slider-output');
    var remaining = this.slider.querySelector('.slider-remaining');
    var thumb = this.slider.querySelector('.slider-thumb');
    output.value = this.levelString();
    output.style.left = this.levelString() + '%';
    thumb.style.left = this.levelString() + '%';
    if (remaining) {
      remaining.style.width = this.remainingString() + '%';
    }
  }


  this.updateSliderLevel =function() {
    var level = this.slider.querySelector('.slider-level');
    level.style.width = this.levelString() + '%';
  }
}

sliders.forEach(function(slider) {
  new Slider(slider);
});
