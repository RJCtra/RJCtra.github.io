
-- *** The Lost Letter ***
SELECT * FROM addresses WHERE address LIKE "%Finnegan%"; -- determine if street address exists
SELECT * FROM addresses WHERE address LIKE "%Sommerville%"; -- obtain address_id
SELECT * FROM scans WHERE address_id = 432; -- view scanned pick actions and package_id
SELECT * FROM packages WHERE id = 384 OR 5436 OR 2437 OR 3529; -- attempted to use package id, better to use address
SELECT * FROM packages WHERE from_address_id = 432; -- check from_address_id to see if contents provides more useful information
SELECT * FROM addresses WHERE id = 854; -- using to_address_id can determine address that letter was delivered to
-- *** The Devious Delivery ***
SELECT * FROM packages WHERE contents LIKE "%duck%"; -- checking to see if any useful information using the 'quack' hook, can see one from_address as NULL id 5098
SELECT * FROM scans WHERE package_id = 5098; -- check scan details of package_id 5098
SELECT * FROM addresses WHERE id = 50; -- curious to see what this returns as
SELECT * FROM addresses WHERE id = 348; -- This is the scanned drop location
-- *** The Forgotten Gift ***
SELECT * FROM addresses WHERE address LIKE "%Maple Place%" OR address LIKE "%Tileston Street%"; -- obtain potential from/to addresses and possible wrong address options 4983 to address / 9873 from address
SELECT * FROM packages WHERE from_address_id = 9873 AND to_address_id = 4983; -- determine whether any packages were sent from grandparent's address to granddaughter's address - got package id 9523
SELECT * FROM scans WHERE id = 9523; -- check status of scanned package - no drop, only pick, assume that driver still has flowers
SELECT * FROM drivers WHERE id = 17; -- check driver's name Mikel


