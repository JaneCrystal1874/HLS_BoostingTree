-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Aem_rom is 
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


architecture rtl of predict_ensemble_Aem_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 => "1", 6 to 8=> "0", 9 to 10=> "1", 11 to 12=> "0", 
    13 => "1", 14 to 15=> "0", 16 to 18=> "1", 19 to 21=> "0", 22 to 24=> "1", 25 to 26=> "0", 27 to 28=> "1", 
    29 => "0", 30 to 31=> "1", 32 => "0", 33 to 35=> "1", 36 to 37=> "0", 38 => "1", 39 to 41=> "0", 
    42 => "1", 43 to 45=> "0", 46 to 48=> "1", 49 to 50=> "0", 51 to 52=> "1", 53 => "0", 54 to 55=> "1", 
    56 to 57=> "0", 58 to 59=> "1", 60 to 61=> "0", 62 => "1", 63 to 64=> "0", 65 to 67=> "1", 68 to 70=> "0", 
    71 to 73=> "1", 74 to 77=> "0", 78 to 81=> "1", 82 => "0", 83 => "1", 84 to 89=> "0", 90 => "1", 
    91 to 92=> "0", 93 => "1", 94 to 97=> "0", 98 to 100=> "1", 101 => "0", 102 => "1", 103 => "0", 
    104 => "1", 105 => "0", 106 to 108=> "1", 109 => "0", 110 to 111=> "1", 112 => "0", 113 to 115=> "1", 
    116 => "0", 117 to 118=> "1", 119 to 120=> "0", 121 to 125=> "1", 126 => "0", 127 => "1", 128 to 130=> "0", 
    131 => "1", 132 to 133=> "0", 134 to 135=> "1", 136 to 137=> "0", 138 => "1", 139 => "0", 140 => "1", 
    141 to 142=> "0", 143 to 144=> "1", 145 to 147=> "0", 148 => "1", 149 => "0", 150 to 151=> "1", 152 to 153=> "0", 
    154 to 156=> "1", 157 to 158=> "0", 159 => "1", 160 to 162=> "0", 163 to 168=> "1", 169 to 171=> "0", 172 to 174=> "1", 
    175 to 177=> "0", 178 to 182=> "1", 183 to 194=> "0" );

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

entity predict_ensemble_Aem is
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

architecture arch of predict_ensemble_Aem is
    component predict_ensemble_Aem_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Aem_rom_U :  component predict_ensemble_Aem_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


