<?php

namespace App\Enum;

enum DishTypePreference: string
{
    case LOVE = 'love';
    case LIKE = 'like';
    case NEUTRAL = 'neutral';
    case DISLIKE = 'dislike';

    public static function values()
    {
        return array_column(self::cases(), 'value');
    }
}
