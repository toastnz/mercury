/*------------------------------------------------------------------
Scroll Control Class
------------------------------------------------------------------*/

export default class scrollControl {
	constructor() {}

	getSpeed() {
		this.events += 1;
		(this.events <= this.easePoint) ? this.ease += 1 : this.ease -= 1;
		return this.speed = (this.distance / (this.easePoint) * this.ease);
	}

	scrollUp() {
		this.y -= this.getSpeed();

		if (this.y >= this.value && this.speed >= 0) {
			window.scrollTo(0, this.y);
		}else {
			this.endScroll();
			return;
		}

		window.requestAnimationFrame(() => {
			this.scrollUp();
		});
	}

	scrollDown() {
		this.y += this.getSpeed();

		if (this.y <= this.value && this.speed >= 0) {
			window.scrollTo(0, this.y);
		}else {
			this.endScroll();
			return;
		}

		window.requestAnimationFrame(() => {
			this.scrollDown();
		});
	}

	endScroll() {
		this.events = 0;
		window.scrollTo(0, this.value);
	}

	scrollTo(value, duration = 500) {
		this.y = window.pageYOffset;
		this.totalEvents = .06 * duration;
		this.value = (value < 0) ? value = 0 : value = value;
		this.distance = Math.abs(this.y - this.value) / (this.totalEvents) * 2;
		this.events = 0;
		this.ease = 0;
		this.easePoint = this.totalEvents / 2;

		if (this.y < this.value) {
			this.scrollDown();
		}else if (this.y > this.value) {
			this.scrollUp();
		}
	}
}