use strict;
use warnings;
use Test::More tests => 3 * 2;

use HTML::Template::Parser::ExprParser;

use t::lib::Util;

expr_eq('1 + 2*3 - 4 / 5 - -6 * (-7 - -8)', [
          'op',
          '-',
          [
            'op',
            '-',
            [
              'op',
              '+',
              [
                'number',
                1
              ],
              [
                'op',
                '*',
                [
                  'number',
                  2
                ],
                [
                  'number',
                  3
                ]
              ]
            ],
            [
              'op',
              '/',
              [
                'number',
                4
              ],
              [
                'number',
                5
              ]
            ]
          ],
          [
            'op',
            '*',
            [
              'number',
              -6
            ],
            [
              'op',
              '-',
              [
                'number',
                -7
              ],
              [
                'number',
                -8
              ]
            ]
          ]
        ]);
expr_eq('trim(${nickname}, 5)', [
          'function',
          [
            'name',
            'trim'
          ],
          [
            'variable',
            'nickname'
          ],
          [
            'number',
            5
          ]
        ]);
expr_eq('1 or 2 and not 3 || ! 4 && 5 == 6 + 7 * !8', [
          'op',
          'or',
          [
            'number',
            1
          ],
          [
            'op',
            'and',
            [
              'number',
              2
            ],
            [
              'op',
              'not',
              [
                'op',
                '||',
                [
                  'number',
                  3
                ],
                [
                  'op',
                  '&&',
                  [
                    'op',
                    '!',
                    [
                      'number',
                      4
                    ]
                  ],
                  [
                    'op',
                    '==',
                    [
                      'number',
                      5
                    ],
                    [
                      'op',
                      '+',
                      [
                        'number',
                        6
                      ],
                      [
                        'op',
                        '*',
                        [
                          'number',
                          7
                        ],
                        [
                          'op',
                          '!',
                          [
                            'number',
                            8
                          ]
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]);