let Hooks = {};
Hooks.Highlight = {
  updated() {
		console.log("why 3 though?", this.el.dataset)
		if (this.handler) {
			console.log("clearing", this.handler);
			clearTimeout(this.handler);
		}
		if (this.el.dataset.highlight === "on") {
			const handler = setTimeout(() => {
				console.log("off");
				this.el.setAttribute("data-highlight", "off");
			}, 1000);
			this.handler = handler;
		}
 }
}

export default Hooks;
