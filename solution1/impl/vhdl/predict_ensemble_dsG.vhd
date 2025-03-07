-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dsG_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_dsG_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 => "00000000", 
    4 => "00000111", 5 => "00000000", 6 => "00001001", 7 => "00001011", 
    8 => "00001101", 9 => "00001111", 10 => "00010001", 11 => "00000000", 
    12 => "00010011", 13 => "00000000", 14 => "00010101", 15 to 21=> "00000000", 
    22 => "00010111", 23 => "00000000", 24 => "00011001", 25 => "00011011", 
    26 => "00000000", 27 => "00011101", 28 => "00000000", 29 => "00011111", 
    30 => "00100001", 31 => "00100011", 32 to 33=> "00000000", 34 => "00100101", 
    35 to 36=> "00000000", 37 => "00100111", 38 => "00101001", 39 to 40=> "00000000", 
    41 => "00101011", 42 => "00101101", 43 => "00101111", 44 to 45=> "00000000", 
    46 => "00110001", 47 => "00000000", 48 => "00110011", 49 => "00110101", 
    50 => "00110111", 51 to 55=> "00000000", 56 => "00111001", 57 => "00111011", 
    58 => "00111101", 59 => "00000000", 60 => "00111111", 61 => "00000000", 
    62 => "01000001", 63 => "00000000", 64 => "01000011", 65 => "01000101", 
    66 => "01000111", 67 to 68=> "00000000", 69 => "01001001", 70 => "00000000", 
    71 => "01001011", 72 to 75=> "00000000", 76 => "01001101", 77 => "00000000", 
    78 => "01001111", 79 => "01010001", 80 => "01010011", 81 => "01010101", 
    82 => "00000000", 83 => "01010111", 84 to 85=> "00000000", 86 => "01011001", 
    87 => "01011011", 88 to 90=> "00000000", 91 => "01011101", 92 => "00000000", 
    93 => "01011111", 94 => "01100001", 95 => "01100011", 96 => "00000000", 
    97 => "01100101", 98 => "01100111", 99 => "01101001", 100 => "00000000", 
    101 => "01101011", 102 => "00000000", 103 => "01101101", 104 => "01101111", 
    105 => "01110001", 106 => "00000000", 107 => "01110011", 108 => "00000000", 
    109 => "01110101", 110 to 115=> "00000000", 116 => "01110111", 117 to 119=> "00000000", 
    120 => "01111001", 121 => "01111011", 122 to 123=> "00000000", 124 => "01111101", 
    125 => "00000000", 126 => "01111111", 127 => "10000001", 128 => "10000011", 
    129 to 130=> "00000000", 131 => "10000101", 132 => "00000000", 133 => "10000111", 
    134 => "10001001", 135 => "10001011", 136 => "00000000", 137 => "10001101", 
    138 => "00000000", 139 => "10001111", 140 => "10010001", 141 to 142=> "00000000", 
    143 => "10010011", 144 => "10010101", 145 to 146=> "00000000", 147 => "10010111", 
    148 => "10011001", 149 to 152=> "00000000", 153 => "10011011", 154 => "10011101", 
    155 => "00000000", 156 => "10011111", 157 => "10100001", 158 => "10100011", 
    159 => "10100101", 160 => "00000000", 161 => "10100111", 162 to 163=> "00000000", 
    164 => "10101001", 165 to 167=> "00000000", 168 => "10101011", 169 => "10101101", 
    170 to 171=> "00000000", 172 => "10101111", 173 to 174=> "00000000", 175 => "10110001", 
    176 => "00000000", 177 => "10110011", 178 to 179=> "00000000", 180 => "10110101", 
    181 to 194=> "00000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_dsG is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_dsG is
    component predict_ensemble_dsG_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dsG_rom_U :  component predict_ensemble_dsG_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


