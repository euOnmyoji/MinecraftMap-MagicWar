#调用此函数请确保at 并 as 法术施放者
#不知道pxxxxx行不行 能at就at吧 
tag @s add TempestING
scoreboard players add @s backoff 1
#召唤as 用来确定向量
execute at @a[distance=..5,tag=!TempestING] run summon armor_stand ~ ~ ~ {Tags:["backoff"],Invisible:1b,Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,Small:1b}
#确定as向量中
execute at @a[distance=..5,tag=!TempestING] as @e[tag=backoff,distance=..1,tag=backoff,limit=1] at @s run tp @s ~ ~ ~ facing entity @a[tag=TempestING,limit=1] eyes
#校对as向量中
execute at @a[distance=..5,tag=!TempestING] as @e[tag=backoff,distance=..1,tag=backoff,limit=1] at @s run tp @s ~ ~ ~ ~ 0
#开始击退玩家1格
execute as @a[distance=..5,tag=!TempestING] at @s rotated as @e[tag=backoff,distance=..1,tag=backoff,limit=1] if block ^ ^ ^-0.1 air run tp @s ^ ^ ^-0.1
#清掉用来确定向量的as
kill @e[tag=backoff,type=armor_stand,distance=..5]
tag @e[scores={backoff=51..}] remove TempestING
scoreboard players reset @e[scores={backoff=51..}] backoff
execute as @s[scores={backoff=1..}] run function skill:tempest
function event:usedskill
#风暴咒相关