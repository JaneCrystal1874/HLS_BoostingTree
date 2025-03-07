-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dPK_rom is 
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


architecture rtl of predict_ensemble_dPK_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000", 1 => "0111", 2 => "0000", 3 => "1011", 4 => "1101", 
    5 => "0000", 6 => "0101", 7 => "0000", 8 => "0101", 9 => "1011", 
    10 to 11=> "0000", 12 => "0010", 13 => "0000", 14 => "1011", 15 => "0001", 
    16 to 17=> "0000", 18 to 19=> "1011", 20 to 21=> "0000", 22 => "0011", 23 to 25=> "0000", 
    26 => "1010", 27 => "0011", 28 to 29=> "0000", 30 => "0001", 31 => "0100", 
    32 => "1010", 33 => "0111", 34 => "1001", 35 => "1010", 36 to 37=> "0000", 
    38 => "0111", 39 to 40=> "0000", 41 => "1010", 42 to 43=> "0000", 44 => "1001", 
    45 => "0111", 46 => "0000", 47 => "1001", 48 => "0011", 49 => "0100", 
    50 => "0111", 51 => "1000", 52 to 53=> "0000", 54 => "0011", 55 => "1000", 
    56 => "0000", 57 => "0001", 58 => "0010", 59 to 62=> "0000", 63 to 64=> "1011", 
    65 to 67=> "0000", 68 => "1001", 69 => "0011", 70 => "1101", 71 => "0101", 
    72 => "0000", 73 => "1001", 74 => "0000", 75 => "1101", 76 => "1100", 
    77 => "0000", 78 => "1001", 79 to 80=> "0000", 81 => "0001", 82 to 84=> "0000", 
    85 => "1101", 86 to 87=> "0000", 88 => "0011", 89 => "0000", 90 => "1001", 
    91 to 93=> "0000", 94 => "1001", 95 => "0000", 96 => "1010", 97 to 98=> "0000", 
    99 => "1010", 100 => "0101", 101 => "0011", 102 => "0000", 103 => "0101", 
    104 => "1001", 105 to 106=> "0000", 107 => "1000", 108 to 109=> "0000", 110 => "0111", 
    111 => "1011", 112 to 114=> "0000", 115 => "0110", 116 => "0000", 117 => "0111", 
    118 => "0000", 119 to 120=> "1011", 121 => "0000", 122 => "0111", 123 => "1010", 
    124 => "0011", 125 => "0000", 126 => "0101", 127 to 128=> "0000", 129 => "0001", 
    130 to 131=> "0000", 132 => "1101", 133 => "1001", 134 => "0111", 135 => "0011", 
    136 => "0000", 137 => "1101", 138 to 142=> "0000", 143 => "0001", 144 => "0000", 
    145 => "0001", 146 => "0000", 147 => "1011", 148 to 149=> "0000", 150 to 151=> "1000", 
    152 to 153=> "0000", 154 => "1000", 155 => "0000", 156 => "0100", 157 to 158=> "1000", 
    159 => "0010", 160 to 162=> "0000", 163 => "1010", 164 => "0010", 165 => "0100", 
    166 => "0001", 167 => "0000", 168 => "1011", 169 => "0001", 170 to 171=> "0000", 
    172 => "0111", 173 to 176=> "0000", 177 => "1011", 178 to 194=> "0000" );

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

entity predict_ensemble_dPK is
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

architecture arch of predict_ensemble_dPK is
    component predict_ensemble_dPK_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dPK_rom_U :  component predict_ensemble_dPK_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


