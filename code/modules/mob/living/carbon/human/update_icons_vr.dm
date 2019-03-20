// TODO - Move this to where it should go ~Leshana
/*/mob/proc/stop_flying()
	if(QDESTROYING(src))
		return
	flying = FALSE
	return 1

/mob/living/carbon/human/stop_flying()
	if((. = ..()))
		update_wing_showing()
*/

/mob/living/carbon/human/proc/get_wing_image()

	//If you are FBP with wing style and didn't set a custom one
/*	if(synthetic && synthetic.includes_wing && !wing_style)
		var/icon/wing_s = new/icon("icon" = synthetic.icon, "icon_state" = "wing") //I dunno. If synths have some custom wing?
		wing_s.Blend(rgb(src.r_skin, src.g_skin, src.b_skin), species.color_mult ? ICON_MULTIPLY : ICON_ADD)
		return image(wing_s)
*/
	//If you have custom wings selected
	if(wing_style && !(wear_suit && wear_suit.flags_inv & HIDETAIL))
		var/icon/wing_s = new/icon("icon" = wing_style.icon, "icon_state" = flapping && wing_style.ani_state ? wing_style.ani_state : wing_style.icon_state)
		if(wing_style.do_colouration)
			wing_s.Blend(rgb(src.r_wing, src.g_wing, src.b_wing), wing_style.color_blend_mode)
		return image(wing_s)