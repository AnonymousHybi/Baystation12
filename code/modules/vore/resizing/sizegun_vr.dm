//
// Size Gun
//

/obj/item/weapon/gun/energy/sizegun
	name = "size gun" //I have no idea why this was called shrink ray when this increased and decreased size.
	desc = "A highly advanced ray gun with a knob on the side to adjust the size you desire. Warning: Do not insert into mouth."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "sizegun-shrink100" // Someone can probably do better. -Ace
	item_state = null	//so the human update icon uses the icon_state instead
	fire_sound = 'sound/weapons/wave.ogg'
	charge_cost = 240
	projectile_type = /obj/item/projectile/beam/sizelaser
	origin_tech = list(TECH_BLUESPACE = 4)
	modifystate = "sizegun-shrink"
	var/size_set_to = 1
	firemodes = list(
		list(mode_name		= "select size",
			projectile_type	= /obj/item/projectile/beam/sizelaser,
			modifystate		= "sizegun-grow",
			fire_sound		= 'sound/weapons/pulse3.ogg'
		))

/obj/item/weapon/gun/energy/sizegun/New()
	..()
	verbs += /obj/item/weapon/gun/energy/sizegun/proc/select_size

/obj/item/weapon/gun/energy/sizegun/attack_self(mob/user)
	. = ..()
	select_size()

/obj/item/weapon/gun/energy/sizegun/consume_next_projectile()
	. = ..()
	var/obj/item/projectile/beam/sizelaser/G = .
	if(istype(G))
		G.set_size = size_set_to

/obj/item/weapon/gun/energy/sizegun/proc/select_size()
	set name = "Select Size"
	set category = "Object"
	set src in view(1)

	var/size_select = input("Put the desired size (25-200%)", "Set Size", size_set_to*100) as num
	if(size_select>200 || size_select<25)
		usr << "<span class='notice'>Invalid size.</span>"
		return
	size_set_to = (size_select/100)
	usr << "<span class='notice'>You set the size to [size_select]%</span>"

/obj/item/weapon/gun/energy/sizegun/examine(mob/user)
	..()
	var/size_examine = (size_set_to*100)
	user << "<span class='info'>It is currently set at [size_examine]%</span>"

//----------------------------
// Xray laser beam effects
//----------------------------



/*

*************Light_range and light_power are not defined vars for these children nor from its parents************
***************Will do later************


/obj/effect/projectile/xray/tracer
	icon_state = "xray"
	light_range = 2
	light_power = 0.5
	light_color = "#00CC33"

/obj/effect/projectile/xray/muzzle
	icon_state = "muzzle_xray"
	light_range = 2
	light_power = 0.5
	light_color = "#00CC33"

/obj/effect/projectile/xray/impact
	icon_state = "impact_xray"
	light_range = 2
	light_power = 0.5
	light_color = "#00CC33"




//
// Beams for size gun
//

/obj/item/projectile/beam/sizelaser
	name = "size beam"
	icon_state = "xray"
	nodamage = 1
	damage = 0
	check_armour = "laser"
	var/set_size = 1 //Let's default to 100%

	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

	on_hit(var/atom/target)
		var/mob/living/M = target
		if(ishuman(target))
			var/mob/living/carbon/human/H = M
			H.resize(set_size)
			H.show_message("<font color='blue'> The beam fires into your body, changing your size!</font>")
			H.update_icons()
		else if (istype(target, /mob/living/))
			var/mob/living/H = M
			H.resize(set_size)
			H.update_icons()
		else
			return 1
*/