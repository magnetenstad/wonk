extends Node

const POPUP = preload("res://Popup.tscn")
var last_popup_x = 400
var last_popup_y = 100
var MAIN
var INBOX

func _init(_main):
	MAIN = _main
	INBOX = MAIN.get_node("Inbox")

func popup_show(x, y, header, body, cancel, _cancel_f, select1, _select1_f, select2, _select2_f, select3, _select3_f):
	var popup = POPUP.instance()
	popup.set_variables(header, body, cancel, _cancel_f, select1, _select1_f, select2, _select2_f, select3, _select3_f)
	popup.set_position(Vector2(x, y))
	popup.MAIN = MAIN
	popup.PF = self
	INBOX.add_child(popup)
	last_popup_x += 10
	last_popup_y += 10
	MAIN.get_node("ClickSound").play()

func popup1():
	popup_show(last_popup_x, last_popup_y, "FREE ANTIVIRUS", "We have to you give free antivirus!!! defnitely remove all virus.", "X", "close", "get free", "trial", "do not get free", "buy_trompo", "sign up", "popup_sign_up")

func computer_is_hacked():
	popup_show(last_popup_x, last_popup_y, "Your computer is hacked!", "Your computer has been hacked, therefore you can not reply to emails. To unhack computer please send a letter to 'The Valley', California with your bank account PIN.", "X", "", "Ok", "close", "Not Ok", "", "Sponsored by Oracle", "java_ad")

func java_ad():
	popup_show(last_popup_x, last_popup_y, "Update Java", "There is a new update available", "X", "close", "Update now", "close", "Update later", "close", "Send me more information", "java_info")

func scan():
	if "Trompo Antivirus" in MAIN.subscriptions:
		popup_show(last_popup_x, last_popup_y, "Completed scan", str(randi()%70+1) + " viruses eliminated by Trompo Antivirus", "X", "close", "Thanks", "close", "Ok", "close", "Buy UltraPro", "trompo_pro")
	else:
		popup_show(last_popup_x, last_popup_y, "Completed scan", str(randi()%70+1) + " viruses found.", "X", "close", "Buy antivirus", "buy_trompo", "Computer will be destroy", "close", "Sponsored by Oracle", "java_ad")

func trompo_pro():
	INBOX.mail_add(INBOX.content["UltraPro"])
	MAIN.subscription_add("Trompo Antivirus UltraPro")

func dolphin():
	if not "DolphinBlock" in MAIN.subscriptions:
		INBOX.mail_add(INBOX.content["Dolphin"])
		MAIN.subscription_add("DolphinBlock")
	else:
		MAIN.get_node("ErrorSound").play()

func java_info():
	INBOX.mail_add(INBOX.content["JavaInfo"])

func popup_sign_up():
	popup_show(last_popup_x, last_popup_y, "SIGN UP", "Ah thank YOU FOr trying our product!! woo", "X", "close", "sign up with email", "", "sign up with phone", "", "do not sign up", "spam_sad")

func spam_sad():
	for i in range(10):
		popup_show(last_popup_x, last_popup_y, "WE're SAD TO SEE YOU GO", "why are you leaving", "X", "close", "", "", "", "", "", "")

func trial():
	INBOX.mail_add(INBOX.content["TrialTrompo"])
	MAIN.subscription_add("Trompo Antivirus")
	pass
func buy_trompo():
	INBOX.mail_add(INBOX.content["BuyTrompo"])
	MAIN.subscription_add("Trompo Antivirus")
func spam():
	# func for sending 100 spam mails
	pass
