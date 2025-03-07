-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_c5D_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_c5D_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 5=> "0", 6 to 7=> "1", 8 => "0", 9 => "1", 10 => "0", 
    11 => "1", 12 to 14=> "0", 15 => "1", 16 to 17=> "0", 18 => "1", 19 => "0", 20 => "1", 
    21 to 22=> "0", 23 => "1", 24 to 26=> "0", 27 => "1", 28 to 29=> "0", 30 to 31=> "1", 32 => "0", 
    33 to 34=> "1", 35 to 37=> "0", 38 to 39=> "1", 40 to 44=> "0", 45 => "1", 46 => "0", 47 to 48=> "1", 
    49 => "0", 50 to 53=> "1", 54 => "0", 55 => "1", 56 => "0", 57 to 59=> "1", 60 to 62=> "0", 
    63 => "1", 64 to 65=> "0", 66 to 67=> "1", 68 to 70=> "0", 71 to 73=> "1", 74 to 75=> "0", 76 to 77=> "1", 
    78 to 79=> "0", 80 to 81=> "1", 82 => "0", 83 => "1", 84 => "0", 85 => "1", 86 => "0", 
    87 to 90=> "1", 91 to 92=> "0", 93 => "1", 94 => "0", 95 => "1", 96 to 97=> "0", 98 => "1", 
    99 => "0", 100 => "1", 101 to 103=> "0", 104 to 105=> "1", 106 => "0", 107 to 109=> "1", 110 to 111=> "0", 
    112 => "1", 113 => "0", 114 to 118=> "1", 119 => "0", 120 => "1", 121 => "0", 122 to 123=> "1", 
    124 to 125=> "0", 126 to 127=> "1", 128 => "0", 129 => "1", 130 => "0", 131 to 133=> "1", 134 to 136=> "0", 
    137 to 138=> "1", 139 => "0", 140 to 141=> "1", 142 to 145=> "0", 146 => "1", 147 to 148=> "0", 149 => "1", 
    150 to 151=> "0", 152 to 153=> "1", 154 => "0", 155 to 158=> "1", 159 to 162=> "0", 163 => "1", 164 => "0", 
    165 to 168=> "1", 169 to 170=> "0", 171 => "1", 172 => "0", 173 => "1", 174 to 175=> "0", 176 => "1", 
    177 => "0", 178 => "1", 179 => "0", 180 => "1", 181 => "0", 182 => "1", 183 => "0", 
    184 to 187=> "1", 188 => "0", 189 to 190=> "1", 191 to 194=> "0" );

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

entity predict_ensemble_c5D is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_c5D is
    component predict_ensemble_c5D_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_c5D_rom_U :  component predict_ensemble_c5D_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


