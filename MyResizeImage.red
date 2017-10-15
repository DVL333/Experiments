Red [
	Title:   "Draw Image Resizing Test"
	File:	 %MyResizeImage.red
	Needs:   'View
]

distance: func [pos [pair!]][square-root add pos/x ** 2 pos/y ** 2]

pic: make object! [
	img: load https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png
	tl: 20x20
	br: 280X280
	gr_sz: 5
	selected: [false false]

	draw_obj: compose [
		image img (tl) (br)
		fill-pen yellow
		circle (tl) (gr_sz)
		circle (br) (gr_sz)
	]

	mouse-down: [
		if (distance (tl - event/offset)) <= gr_sz [
			selected/1: true
		]
		if (distance br - event/offset) <= gr_sz [
			selected/2: true
		]
	]

	mouse-up: [
		selected/1: false
		selected/2: false
	]

	mouse-over: [
		if selected/1 = true [tl: event/offset]
		if selected/2 = true [br: event/offset]
	]
]

main-window: [
	title "Draw Image Resizing Test"
	backdrop water
	text bold font-color white "Red resize image test"
	text bold font-color yellow "Drag the grab handles"
	return
	canv: base 300x300 black all-over draw pic/draw_obj
		on-down :pic/mouse-down
		on-up   :pic/mouse-up
		on-over :pic/mouse-over
]

view main-window
