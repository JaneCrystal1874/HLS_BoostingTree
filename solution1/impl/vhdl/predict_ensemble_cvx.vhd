-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cvx_rom is 
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


architecture rtl of predict_ensemble_cvx_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 to 6=> "00000000", 7 => "00001010", 8 => "00000000", 9 => "00001100", 
    10 => "00001110", 11 => "00010000", 12 to 15=> "00000000", 16 => "00010010", 
    17 => "00000000", 18 => "00010100", 19 => "00010110", 20 to 21=> "00000000", 
    22 => "00011000", 23 => "00011010", 24 => "00011100", 25 => "00011110", 
    26 => "00100000", 27 => "00100010", 28 => "00100100", 29 => "00100110", 
    30 to 34=> "00000000", 35 => "00101000", 36 to 38=> "00000000", 39 => "00101010", 
    40 => "00101100", 41 => "00000000", 42 => "00101110", 43 => "00110000", 
    44 => "00110010", 45 => "00000000", 46 => "00110100", 47 => "00110110", 
    48 to 49=> "00000000", 50 => "00111000", 51 => "00000000", 52 => "00111010", 
    53 to 54=> "00000000", 55 => "00111100", 56 to 57=> "00000000", 58 => "00111110", 
    59 => "01000000", 60 to 62=> "00000000", 63 => "01000010", 64 to 65=> "00000000", 
    66 => "01000100", 67 => "01000110", 68 => "00000000", 69 => "01001000", 
    70 => "01001010", 71 => "01001100", 72 => "01001110", 73 => "01010000", 
    74 to 75=> "00000000", 76 => "01010010", 77 to 78=> "00000000", 79 => "01010100", 
    80 => "00000000", 81 => "01010110", 82 => "00000000", 83 => "01011000", 
    84 => "01011010", 85 => "01011100", 86 => "01011110", 87 => "00000000", 
    88 => "01100000", 89 => "00000000", 90 => "01100010", 91 to 92=> "00000000", 
    93 => "01100100", 94 => "01100110", 95 => "01101000", 96 => "00000000", 
    97 => "01101010", 98 to 102=> "00000000", 103 => "01101100", 104 => "00000000", 
    105 => "01101110", 106 => "01110000", 107 => "01110010", 108 => "01110100", 
    109 => "00000000", 110 => "01110110", 111 to 116=> "00000000", 117 => "01111000", 
    118 => "01111010", 119 => "00000000", 120 => "01111100", 121 => "00000000", 
    122 => "01111110", 123 => "10000000", 124 => "00000000", 125 => "10000010", 
    126 => "10000100", 127 => "00000000", 128 => "10000110", 129 => "10001000", 
    130 => "10001010", 131 to 132=> "00000000", 133 => "10001100", 134 => "00000000", 
    135 => "10001110", 136 to 139=> "00000000", 140 => "10010000", 141 => "10010010", 
    142 => "00000000", 143 => "10010100", 144 => "10010110", 145 => "10011000", 
    146 => "00000000", 147 => "10011010", 148 => "00000000", 149 => "10011100", 
    150 to 151=> "00000000", 152 => "10011110", 153 to 157=> "00000000", 158 => "10100000", 
    159 => "10100010", 160 => "10100100", 161 => "10100110", 162 => "00000000", 
    163 => "10101000", 164 => "10101010", 165 => "10101100", 166 => "10101110", 
    167 to 168=> "00000000", 169 => "10110000", 170 => "10110010", 171 to 174=> "00000000", 
    175 => "10110100", 176 => "10110110", 177 => "10111000", 178 to 180=> "00000000", 
    181 => "10111010", 182 to 183=> "00000000", 184 => "10111100", 185 => "00000000", 
    186 => "10111110", 187 to 194=> "00000000" );


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

entity predict_ensemble_cvx is
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

architecture arch of predict_ensemble_cvx is
    component predict_ensemble_cvx_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cvx_rom_U :  component predict_ensemble_cvx_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


