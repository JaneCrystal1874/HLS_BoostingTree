-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bjl_rom is 
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


architecture rtl of predict_ensemble_bjl_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 7=> "1", 8 to 11=> "0", 12 to 13=> "1", 14 to 17=> "0", 
    18 => "1", 19 to 20=> "0", 21 => "1", 22 to 24=> "0", 25 to 26=> "1", 27 => "0", 28 to 29=> "1", 
    30 => "0", 31 to 32=> "1", 33 => "0", 34 to 35=> "1", 36 => "0", 37 => "1", 38 to 39=> "0", 
    40 to 41=> "1", 42 to 43=> "0", 44 => "1", 45 to 48=> "0", 49 => "1", 50 => "0", 51 => "1", 
    52 to 55=> "0", 56 to 62=> "1", 63 => "0", 64 to 67=> "1", 68 => "0", 69 => "1", 70 => "0", 
    71 => "1", 72 => "0", 73 to 74=> "1", 75 => "0", 76 => "1", 77 to 78=> "0", 79 to 81=> "1", 
    82 to 90=> "0", 91 => "1", 92 to 93=> "0", 94 to 95=> "1", 96 => "0", 97 => "1", 98 => "0", 
    99 => "1", 100 to 101=> "0", 102 to 104=> "1", 105 => "0", 106 to 109=> "1", 110 to 111=> "0", 112 => "1", 
    113 to 114=> "0", 115 => "1", 116 => "0", 117 => "1", 118 => "0", 119 to 121=> "1", 122 => "0", 
    123 => "1", 124 to 125=> "0", 126 => "1", 127 to 130=> "0", 131 to 132=> "1", 133 => "0", 134 to 136=> "1", 
    137 to 141=> "0", 142 to 150=> "1", 151 => "0", 152 to 153=> "1", 154 => "0", 155 => "1", 156 => "0", 
    157 => "1", 158 to 161=> "0", 162 => "1", 163 => "0", 164 => "1", 165 to 166=> "0", 167 to 168=> "1", 
    169 => "0", 170 => "1", 171 => "0", 172 => "1", 173 to 174=> "0", 175 to 176=> "1", 177 => "0", 
    178 to 179=> "1", 180 => "0", 181 to 182=> "1", 183 => "0", 184 => "1", 185 => "0", 186 to 188=> "1", 
    189 to 194=> "0" );

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

entity predict_ensemble_bjl is
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

architecture arch of predict_ensemble_bjl is
    component predict_ensemble_bjl_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bjl_rom_U :  component predict_ensemble_bjl_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


