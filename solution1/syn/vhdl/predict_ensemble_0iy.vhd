-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_0iy_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_0iy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0100", 2 => "1011", 3 to 4=> "0000", 5 => "0001", 
    6 => "1011", 7 to 9=> "0000", 10 => "1001", 11 => "0101", 12 => "0111", 
    13 to 15=> "0000", 16 => "1011", 17 => "0110", 18 => "1001", 19 to 21=> "0000", 
    22 => "1010", 23 => "0010", 24 => "0000", 25 => "0100", 26 => "0010", 
    27 => "1000", 28 => "0000", 29 => "0001", 30 => "0010", 31 => "1011", 
    32 => "1100", 33 to 35=> "0000", 36 => "1011", 37 => "0001", 38 => "0101", 
    39 to 40=> "0000", 41 to 42=> "1011", 43 => "0000", 44 => "0101", 45 => "0100", 
    46 => "0000", 47 => "1011", 48 to 49=> "0000", 50 => "1100", 51 => "0010", 
    52 => "0100", 53 to 56=> "0000", 57 => "1100", 58 to 59=> "0000", 60 => "1101", 
    61 => "0110", 62 => "0000", 63 => "1000", 64 to 65=> "0000", 66 => "1011", 
    67 => "0010", 68 to 69=> "0110", 70 => "0101", 71 => "1000", 72 => "0000", 
    73 => "1001", 74 => "1100", 75 => "0000", 76 => "0011", 77 => "1001", 
    78 to 85=> "0000", 86 => "1100", 87 => "0000", 88 => "0011", 89 => "1101", 
    90 => "0001", 91 => "0000", 92 => "0010", 93 to 94=> "0000", 95 => "1101", 
    96 => "0000", 97 => "1000", 98 => "0000", 99 => "0011", 100 => "0100", 
    101 => "0000", 102 => "0011", 103 => "0000", 104 => "0011", 105 => "0000", 
    106 => "0010", 107 => "0011", 108 => "0000", 109 => "0011", 110 => "0000", 
    111 => "1011", 112 => "0011", 113 to 118=> "0000", 119 => "0100", 120 to 122=> "0000", 
    123 => "1000", 124 => "0100", 125 => "0000", 126 => "0111", 127 => "0000", 
    128 => "0100", 129 to 131=> "0000", 132 => "1000", 133 => "0101", 134 => "0100", 
    135 to 136=> "0000", 137 => "0100", 138 => "1010", 139 => "1011", 140 => "1010", 
    141 => "1000", 142 => "0101", 143 => "0000", 144 => "1011", 145 => "0000", 
    146 to 147=> "0111", 148 to 150=> "0000", 151 => "0111", 152 => "1000", 153 => "0000", 
    154 => "0111", 155 to 158=> "0000", 159 => "1011", 160 to 161=> "0000", 162 => "1001", 
    163 => "0011", 164 => "0101", 165 to 168=> "0000", 169 => "1101", 170 => "0010", 
    171 => "0000", 172 to 173=> "0010", 174 => "1011", 175 to 176=> "0000", 177 => "1100", 
    178 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_0iy is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_0iy is
    component predict_ensemble_0iy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_0iy_rom_U :  component predict_ensemble_0iy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


