class Clock {
  constructor() {
    this.date = new Date();
    this.hour = this.date.getHours();
    this.minute = this.date.getMinutes();
    this.second = this.date.getSeconds();
    this._tick = this._tick.bind(this);
    setInterval(this._tick, 1000);
  }

  printTime() {
    console.log(`${this.hour}:${this.minute}:${this.second}`);
  }

  _tick() {
    this.second += 1;

    if (this.second === 60) {
      this.minute += 1;
      this.second = 0;
    } else if (this.minute === 60) {
      this.hour += 1;
      this.minute = 0;
    }
    this.hour = this.hour % 24;
    this.printTime();
  }
}

const clock = new Clock();
