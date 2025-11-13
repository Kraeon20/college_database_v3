START TRANSACTION;
-- lock the room
SELECT room_id, room_number, capacity
FROM room
WHERE room_id = 5
FOR UPDATE;

-- update room cap
UPDATE room
SET capacity = 55
WHERE room_id = 5;

COMMIT;
