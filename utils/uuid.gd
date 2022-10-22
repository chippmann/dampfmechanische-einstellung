extends Reference
class_name Uuid

static func _getRandomInt(maxValue: int) -> int:
	randomize()
	return randi() % maxValue

static func _randomBytes(numberOfBytes: int) -> Array:
	var byteArray: Array = []
	
# warning-ignore:unused_variable
	for ignoredIndex in range(0, numberOfBytes):
		byteArray.append(_getRandomInt(256))
	
	return byteArray

static func _uuid_binary() -> Array:
	var byteArray: Array = _randomBytes(16)
	
	byteArray[6] = (byteArray[6] & 0x0f) | 0x40
	byteArray[8] = (byteArray[8] & 0x3f) | 0x80
	return byteArray

static func generate() -> String:
	var byteArray: Array = _uuid_binary()
	
	var low: String = "%02x%02x%02x%02x" % [byteArray[0], byteArray[1], byteArray[2], byteArray[3]]
	var mid: String = "%02x%02x" % [byteArray[4], byteArray[5]]
	var hi: String = "%02x%02x" % [byteArray[6], byteArray[7]]
	var clock: String = "%02x%02x" % [byteArray[8], byteArray[9]]
	var node: String = "%02x%02x%02x%02x%02x%02x" % [byteArray[10], byteArray[11], byteArray[12], byteArray[13], byteArray[14], byteArray[15]]
	
	return "%s-%s-%s-%s-%s" % [low, mid, hi, clock, node]
